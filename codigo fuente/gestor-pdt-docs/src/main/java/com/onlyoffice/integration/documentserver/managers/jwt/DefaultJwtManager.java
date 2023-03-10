/**
 *
 * (c) Copyright Ascensio System SIA 2021
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

package com.onlyoffice.integration.documentserver.managers.jwt;

import java.util.LinkedHashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.primeframework.jwt.Signer;
import org.primeframework.jwt.Verifier;
import org.primeframework.jwt.domain.JWT;
import org.primeframework.jwt.hmac.HMACSigner;
import org.primeframework.jwt.hmac.HMACVerifier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.ObjectMapper;

import es.juntadeandalucia.ctpda.gestionpdt.service.core.exception.BaseException;

@Component
public class DefaultJwtManager implements JwtManager {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Value("${files.docservice.secret}")
    private String tokenSecret;
    @Autowired
    private ObjectMapper objectMapper;
    @Autowired
    private transient JSONParser parser;

    // create document token
    public String createToken(Map<String, Object> payloadClaims) {
        try {
            // build a HMAC signer using a SHA-256 hash
            Signer signer = HMACSigner.newSHA256Signer(tokenSecret);
            JWT jwt = new JWT();
            for (Map.Entry<String, Object> entry : payloadClaims.entrySet()) {  // run through all the keys from the payload
            	String key = entry.getKey();
                jwt.addClaim(key, payloadClaims.get(key));  // and write each claim to the jwt
            }
            return JWT.getEncoder().encode(jwt, signer);  // sign and encode the JWT to a JSON string representation
        } catch (Exception e) {
            return "";
        }
    }

    // check if the token is enabled
    public boolean tokenEnabled() {
        return tokenSecret != null && !tokenSecret.isEmpty();
    }

    // read document token
    public JWT readToken(String token) {
        try {
            // build a HMAC verifier using the token secret
            Verifier verifier = HMACVerifier.newVerifier(tokenSecret);
            return JWT.getDecoder().decode(token, verifier);  // verify and decode the encoded string JWT to a rich object
        } catch (Exception exception) {
            return null;
        }
    }

    // parse the body
    public JSONObject parseBody(String payload, String header) throws BaseException {
        JSONObject body;
        try {
            Object obj = parser.parse(payload);  // get body parameters by parsing the payload
            body = (JSONObject) obj;
        } catch (Exception ex) {
            throw new BaseException("{\"error\":1,\"message\":\"JSON Parsing error\"}");
        }
        if (tokenEnabled()) {  // check if the token is enabled
            String token = readTokenKey(body, header);

            JWT jwt = readToken(token);  // read token
            if (jwt == null) {
                throw new BaseException("{\"error\":1,\"message\":\"JWT validation failed\"}");
            }
            if (jwt.getObject("payload") != null) {  // get payload from the token and check if it is not empty
                try {
                    @SuppressWarnings("unchecked") LinkedHashMap<String, Object> jwtPayload =
                            (LinkedHashMap<String, Object>)jwt.getObject("payload");

                    jwt.claims = jwtPayload;
                } catch (Exception ex) {
                    throw new BaseException("{\"error\":1,\"message\":\"Wrong payload\"}");
                }
            }
            try {
                Object obj = parser.parse(objectMapper.writeValueAsString(jwt.claims));
                body = (JSONObject) obj;
            } catch (Exception ex) {
                throw new BaseException("{\"error\":1,\"message\":\"Parsing error\"}");
            }
        }

        return body;
    }
    
	private String readTokenKey(JSONObject body, String header) throws BaseException {
		String token = (String) body.get("token"); // get token from the body
		if (token == null && header != null && !header.isBlank()) { // and the header is defined
			token = header.startsWith("Bearer ") ? header.substring(7) : header; // get token from the header (it is
		}
		
		if (token == null || token.isBlank()) {
			throw new BaseException("{\"error\":1,\"message\":\"JWT expected\"}");
		}

		return token;
	}
}
