# cicd-java-project

![image](https://github.com/pbdinesh057/cicd-java-project/assets/84852077/8ac4f987-678a-4870-8bdb-70399c9f3331)

![image](https://github.com/pbdinesh057/cicd-java-project/assets/84852077/162cf529-3f3b-4d66-80bb-f89724290fa2)

## UNIT TESTING
### what is unit testing?
```
unit testing is a way of testing individual pieces of code to make sure that they work as expected. Unit tests are typically written by the developers of the code, and they are run frequently, often as part of the development process.
```
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
