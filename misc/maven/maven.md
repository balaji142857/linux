Maven
=======
>  
 - In maven a parent module can have its packaging only as POM - implying it cannot contain any source code 
 - Declaring dependencies in the  dependecyManagement section of the parent pom alone, wont make those dependencies available to child modules. Child modules will also have to declare them (scope and version can be controlled globally in the parent pom)
 - However dependencies declared directly in the `<dependencies>` section in the parent pom will be inherited by the child modules
 - Child modules will also inherit the groupId & version from parent. You can however override them
 - Maven by default expects parent pom to be present one directory above the child pom location. if child pom is currentDirectory, parent pom has to be in ../ and not ../parent/. To specify a different location use the `<relativePath>` option
 - Project Aggregation is similar to Project Inheritance. But instead of specifying the parent POM from the module, it specifies the modules from the parent POM. By doing so, the parent project now knows its modules, and if a Maven command is invoked against the parent project, that Maven command will then be executed to the parent's modules as well.
 -  *Project Inheritance vs Project Aggregation*
If you have several Maven projects, and they all have similar configurations, you can refactor your projects by pulling out those similar configurations and making a parent project. Thus, all you have to do is to let your Maven projects inherit that parent project, and those configurations would then be applied to all of them. And if you have a group of projects that are built or processed together, you can create a parent project and have that parent project declare those projects as its modules. 



Reference Links:
 1. http://stackoverflow.com/questions/2619598/differences-between-dependencymanagement-and-dependencies-in-maven
 2.  http://stackoverflow.com/questions/8846426/maven-inheritance-and-aggregation-example-architecture
 3. https://maven.apache.org/guides/introduction/introduction-to-the-pom.html