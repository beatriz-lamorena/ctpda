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

package com.onlyoffice.integration.mappers;

import java.util.stream.Collectors;

import javax.annotation.PostConstruct;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

import com.onlyoffice.integration.documentserver.models.filemodel.CommentGroup;
import com.onlyoffice.integration.entities.Group;
import com.onlyoffice.integration.entities.Permission;

@Component
@Primary
public class PermissionsMapper extends AbstractMapper<Permission, com.onlyoffice.integration.documentserver.models.filemodel.Permission> {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Autowired
    private transient ModelMapper modelMapper;

    public PermissionsMapper() {
        super(com.onlyoffice.integration.documentserver.models.filemodel.Permission.class);
    }

    @PostConstruct
    public void configure() {  // configure the permission mapper
        modelMapper.createTypeMap(Permission.class, com.onlyoffice.integration.documentserver.models.filemodel.Permission.class)  // create the type map
                .setPostConverter(modelConverter());  // and apply the post converter to it
    }

    @Override
    void handleSpecificFields(Permission source, com.onlyoffice.integration.documentserver.models.filemodel.Permission destination) {  // handle specific permission fields
        destination.setReviewGroups(source.getReviewGroups().stream().map(Group::getName).collect(Collectors.toList()));  // set the reviewGroups parameter
        destination.setCommentGroups(  // set the commentGroups parameter
                new CommentGroup(
                        source.getCommentsViewGroups().stream().map(Group::getName).collect(Collectors.toList()),
                        source.getCommentsEditGroups().stream().map(Group::getName).collect(Collectors.toList()),
                        source.getCommentsRemoveGroups().stream().map(Group::getName).collect(Collectors.toList())
                )
        );
    }
}
