# SalesAPI-V1

### Setting Up Listener for the Project
* Use the following Domain project to run this repository - [SDHTTPListener](https://github.com/SauravB7/SDHTTPListener)
* Or, uncomment the following line in the ***src/main/mule/SalesAPI-main.xml***
    ```
    <http:listener-config name="SDHTTP_Listener_config">
        <http:listener-connection host="${api.host}" port="${api.port}" readTimeout="${api.listener_timeout}" connectionIdleTimeout="${api.listener_timeout}"/>
    </http:listener-config>
    ```
  Update the ***src/main/resources/configuration.yaml*** to set your preferred host, port and path.
    ```
    api:
      host: "0.0.0.0"
      port: "8091"
      path: "/salesms/v1/*"
      console: "/salesms/v1/console"
      listener_timeout: "30000"
      id: "17801830"
    ```

### Setting Up SystemAPI Config for the Project
Update the following parameters with your SystemAPI configs in ***src/main/resources/configuration.yaml***. Update the host and port where you are hosting the [**SalesDBSysAPI-V1**](https://github.com/SauravB7/SalesDBSysAPI-V1)
```
salesdbsysapi:
  host: "192.168.15.10"
  port: "8091"
  basepath: "/salesdbms/v1"
  connectiontimeout: "30000"
  responsetimeout: "30000"
```

### Creating the Deployable Package
To create a deployable package from your configured Project, run the following Maven command inside your Project root folder.
```
mvn clean package
```

### Mock Service and Exchange Doc
Mock Service is RAML is published in the Exchange: [***SalesAPI-V1 Exchange***](https://anypoint.mulesoft.com/exchange/portals/test-4779/64efc3bc-f2ea-4c4d-9159-51c6597ce859/salesapi/)
