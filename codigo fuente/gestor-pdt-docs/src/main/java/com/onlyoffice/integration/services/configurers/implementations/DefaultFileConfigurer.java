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

package com.onlyoffice.integration.services.configurers.implementations;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.ObjectFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.onlyoffice.integration.documentserver.managers.jwt.JwtManager;
import com.onlyoffice.integration.documentserver.models.enums.DocumentType;
import com.onlyoffice.integration.documentserver.models.filemodel.FileModel;
import com.onlyoffice.integration.documentserver.models.filemodel.Permission;
import com.onlyoffice.integration.documentserver.util.file.FileUtility;
import com.onlyoffice.integration.mappers.Mapper;
import com.onlyoffice.integration.services.configurers.FileConfigurer;
import com.onlyoffice.integration.services.configurers.wrappers.DefaultDocumentWrapper;
import com.onlyoffice.integration.services.configurers.wrappers.DefaultFileWrapper;

@Service
@Primary
public class DefaultFileConfigurer implements FileConfigurer<DefaultFileWrapper> {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
    private transient ObjectFactory<FileModel> fileModelObjectFactory;

    @Autowired
    private FileUtility fileUtility;

    @Autowired
    private JwtManager jwtManager;

    @Autowired
    private Mapper<com.onlyoffice.integration.entities.Permission, Permission> mapper;

    @Autowired
    private DefaultDocumentConfigurer defaultDocumentConfigurer;

    @Autowired
    private DefaultEditorConfigConfigurer defaultEditorConfigConfigurer;

    public void configure(FileModel fileModel, DefaultFileWrapper wrapper){  // define the file configurer
        if (fileModel != null){  // check if the file model is specified
            String fileName = wrapper.getFileName();  // get the fileName parameter from the file wrapper

            DocumentType documentType = fileUtility.getDocumentType(fileName);  // get the document type of the specified file
            fileModel.setDocumentType(documentType);  // set the document type to the file model
            fileModel.setType(wrapper.getType());  // set the platform type to the file model

            Permission userPermissions = mapper.toModel(wrapper.getUser().getPermissions());  // convert the permission entity to the model

            wrapper.setCanEdit(userPermissions.getEdit());

            DefaultDocumentWrapper documentWrapper = DefaultDocumentWrapper  // define the document wrapper
                    .builder()
                    .fileName(fileName)
                    .permission(userPermissions)
                    //.favorite(wrapper.getUser().getFavorite())
                    .build();

            defaultDocumentConfigurer.configure(fileModel.getDocument(), documentWrapper);  // define the document configurer
            defaultEditorConfigConfigurer.configure(fileModel.getEditorConfig(), wrapper);  // define the editorConfig configurer

            Map<String, Object> map = new HashMap<>();
            map.put("type", fileModel.getType());
            map.put("documentType", documentType);
            map.put("document", fileModel.getDocument());
            map.put("editorConfig", fileModel.getEditorConfig());

            fileModel.setToken(jwtManager.createToken(map));  // create a token and set it to the file model
        }
    }

    @Override
    public FileModel getFileModel(DefaultFileWrapper wrapper) {  // get file model
        FileModel fileModel = fileModelObjectFactory.getObject();
        configure(fileModel, wrapper);  // and configure it
        return fileModel;
    }

}
