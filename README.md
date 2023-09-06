﻿# cicd-java-project

![image](https://github.com/pbdinesh057/cicd-java-project/assets/84852077/8ac4f987-678a-4870-8bdb-70399c9f3331)

![image](https://github.com/pbdinesh057/cicd-java-project/assets/84852077/162cf529-3f3b-4d66-80bb-f89724290fa2)

## UNIT TESTING
### what is unit testing?
-  unit testing is a way of testing individual pieces of code to make sure that they work as expected. Unit tests are     typically written by the developers of the code, and they are run frequently, often as part of the development process.
-  The mvn test command is used to run unit tests in a Maven project.
-  When you run the mvn test command, Maven will first compile your project's source code. Then, it will run all of the unit tests in your project. If any of the unit tests fail, Maven 
   will stop the build process and print the errors to the console.

-  The mvn test command can be used to run all of the unit tests in a project, or it can be used to run a specific set of unit tests. To run a specific set of unit tests, you can use the -    Dtest parameter. For example, the following command will run all of the unit tests in the com.example.myproject package:

```
mvn test -Dtest=com.example.myproject
```
You can also use the -Dtest parameter to run a specific unit test class or method. For example, the following command will run the MyTest class:

```
mvn test -Dtest=MyTest
```



## INTEGRATION TESTING
### what is Integration Testing
-  Integration testing is a software testing technique that focuses on verifying the interactions and interfaces between different components or modules of a system to ensure that they work correctly together as a whole. Integration tests are performed to identify and address issues that may arise when multiple components are integrated, such as communication problems, data mismatches, or compatibility issues.

-  **Database Integration**: Verifying that the application interacts correctly with a database (e.g., CRUD operations, data retrieval, and transactions).

-  **Service Integration**: Testing the integration of various services or components within the application, including RESTful services, microservices, or external APIs.

-  **External Systems Integration**: Ensuring that the application interacts properly with external systems or services, such as message queues, cloud services, or third-party APIs.

-  **Configuration Integration**: Testing how the application behaves with different configurations, including different databases, environments (e.g., development, testing, production), and settings.

To perform integration testing using Maven in a Java project

### Set Up the Project Structure:
-  Organize your integration tests in a separate directory structure within your project. Conventionally, integration tests are placed in a directory like src/test/java alongside unit tests.

-  mvn verify: This part of the command triggers the Maven build, specifically the verify phase. During this phase, Maven executes various tasks, including:

```
-  Compiling the source code.
-  Running unit tests (by default).
-  Packaging the application.
-  Running integration tests (if configured).
```

# STATIC CODE ANALYSIS
-  Static code analysis is a technique used to evaluate the source code of a program without actually executing it. The goal is to identify potential issues, vulnerabilities, code quality violations, and other problems in the codebase. Static analysis tools examine the code's structure, syntax, and patterns to find issues that might lead to bugs, security vulnerabilities, or maintainability problems.

```
mvn clean install sonar:sonar (or) mvn clean package sonar:sonar

```
-  In Maven, when you see sonar:sonar as part of a command, it is referring to the execution of a specific Maven plugin and its goal. The sonar:sonar goal is associated with the SonarQube Scanner for Maven plugin (also known as the SonarQube Maven Plugin).


-  Plugin: The "SonarQube Scanner for Maven" plugin is a Maven plugin designed to integrate with SonarQube, a code quality and static analysis platform.

-  Goal: In Maven, a goal is a specific task that a plugin can perform. When you execute sonar:sonar, you are instructing Maven to run the sonar goal provided by the SonarQube Scanner for Maven plugin.

-  **Purpose**: The purpose of running sonar:sonar is to trigger the analysis of your project's source code using SonarQube. This analysis evaluates the code for various quality, security, and maintainability issues and produces detailed reports that can be viewed in the SonarQube platform.

#### -  **_So, when you include sonar:sonar in your Maven command, you are essentially telling Maven to execute the SonarQube analysis task, which sends your project's code and analysis results to the SonarQube server for review and reporting._**