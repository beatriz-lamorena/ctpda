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

import org.json.simple.JSONObject;
import org.primeframework.jwt.domain.JWT;

import es.juntadeandalucia.ctpda.gestionpdt.service.core.exception.BaseException;

import java.io.Serializable;
import java.util.Map;

// specify the jwt manager functions
public interface JwtManager extends Serializable{
    boolean tokenEnabled();  // check if the token is enabled
    String createToken(Map<String, Object> payloadClaims);  // create document token
    JWT readToken(String token);  // read document token
    JSONObject parseBody(String payload, String header) throws BaseException;  // parse the body
}
