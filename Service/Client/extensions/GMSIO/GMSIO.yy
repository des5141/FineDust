{
    "id": "b4fadcde-362d-4687-9d98-9b124c95f28a",
    "modelName": "GMExtension",
    "mvc": "1.0",
    "name": "GMSIO",
    "IncludedResources": [
        
    ],
    "androidPermissions": [
        
    ],
    "androidProps": false,
    "androidactivityinject": "",
    "androidclassname": "",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "",
    "copyToTargets": 32,
    "date": "2019-08-16 03:09:36",
    "description": "GMS bindings for GMS.IO (Alpha). Don't forget to import the __cobj_gmsio__.object.gmx!",
    "extensionName": "",
    "files": [
        {
            "id": "e3468c18-adf5-427b-908f-c1e1dc9ba6f3",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 0,
            "filename": "socket.io.js",
            "final": "",
            "functions": [
                
            ],
            "init": "",
            "kind": 5,
            "order": [
                
            ],
            "origname": "extensions\\socket.io.js",
            "uncompress": false
        },
        {
            "id": "33d31099-723e-4023-a726-e1f9c2892c26",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 0,
            "filename": "gmsio_html5_adapter.js",
            "final": "",
            "functions": [
                {
                    "id": "b9d72ced-cac4-451a-878f-1d0939779613",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "__gmsio_html5_connect__",
                    "help": "__gmsio_html5_connect__(host,port)",
                    "hidden": false,
                    "kind": 11,
                    "name": "__gmsio_html5_connect__",
                    "returnType": 2
                },
                {
                    "id": "38f1dc03-b54a-48e4-9069-2f37224b40ef",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__gmsio_html5_status__",
                    "help": "__gmsio_html5_status__()",
                    "hidden": false,
                    "kind": 11,
                    "name": "__gmsio_html5_status__",
                    "returnType": 2
                },
                {
                    "id": "0fddb367-c048-4af1-abc3-8a6cbc10565c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "__gmsio_html5_send_message__",
                    "help": "__gmsio_html5_send_message__(msg)",
                    "hidden": false,
                    "kind": 11,
                    "name": "__gmsio_html5_send_message__",
                    "returnType": 2
                },
                {
                    "id": "9eeeab34-1312-4280-b65f-9670887659c0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__gmsio_html5_has_message__",
                    "help": "__gmsio_html5_has_message__()",
                    "hidden": false,
                    "kind": 11,
                    "name": "__gmsio_html5_has_message__",
                    "returnType": 2
                },
                {
                    "id": "31229958-3482-4105-8693-822fbe69fcf2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__gmsio_html5_get_message__",
                    "help": "__gmsio_html5_get_message__()",
                    "hidden": false,
                    "kind": 11,
                    "name": "__gmsio_html5_get_message__",
                    "returnType": 1
                },
                {
                    "id": "7b1d536c-a32d-48be-83d7-280a15df7290",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__gmsio_html5_disconnect__",
                    "help": "__gmsio_html5_disconnect__()",
                    "hidden": false,
                    "kind": 11,
                    "name": "__gmsio_html5_disconnect__",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 5,
            "order": [
                "b9d72ced-cac4-451a-878f-1d0939779613",
                "38f1dc03-b54a-48e4-9069-2f37224b40ef",
                "0fddb367-c048-4af1-abc3-8a6cbc10565c",
                "9eeeab34-1312-4280-b65f-9670887659c0",
                "31229958-3482-4105-8693-822fbe69fcf2",
                "7b1d536c-a32d-48be-83d7-280a15df7290"
            ],
            "origname": "extensions\\gmsio_html5_adapter.js",
            "uncompress": false
        },
        {
            "id": "62753d95-8851-4ad5-9bd9-fe2ec6c3ec8f",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                {
                    "id": "0f7c3efc-d9b0-410c-bd53-0e980a76c4d4",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "gmsio_status_disconnected",
                    "hidden": false,
                    "value": "-1"
                },
                {
                    "id": "e35fbd03-3b3c-4715-b7f4-912b99c73fb6",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "gmsio_status_connecting",
                    "hidden": false,
                    "value": "0"
                },
                {
                    "id": "f9c9ebc6-6b81-4146-83a7-0f53466492b0",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "gmsio_status_connected",
                    "hidden": false,
                    "value": "1"
                }
            ],
            "copyToTargets": 0,
            "filename": "gmsio_constants",
            "final": "",
            "functions": [
                
            ],
            "init": "",
            "kind": 4,
            "order": [
                
            ],
            "origname": "extensions\\gmsio_constants",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": false,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosdelegatename": "",
    "iosplistinject": "",
    "license": "MIT License.",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "packageID": "",
    "productID": "",
    "sourcedir": "",
    "tvosProps": false,
    "tvosSystemFrameworkEntries": [
        
    ],
    "tvosThirdPartyFrameworkEntries": [
        
    ],
    "tvosclassname": "",
    "tvosdelegatename": "",
    "tvosmaccompilerflags": "",
    "tvosmaclinkerflags": "",
    "tvosplistinject": "",
    "version": "0.0.1"
}