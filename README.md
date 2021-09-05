### Using Tags in Robot Framework

1. Include tag while running test

    `> robot --include=sanity Tags.robot`
    
    `> robot -i=sanity Tags.robot`

2. Include multiple tags

    `> robot -i=sanity -i=smoke Tags.robot`

3. Exclude tag

    `> robot --exclude=smoke TestCases\Tags.robot`
    
    `> robot -e=smoke TestCases\Tags.robot`


### Running multiple Tests

Put all the test cases (.robot) file inside TestCases folder and run:

` > robot TestCases\ `

We can also user regular expression to run specific test cases.

` > robot TestCases\Reg*.robot `

This will run all the test cases for which the name starts with "Reg"

### Parallel Testing in Robot Framework

Install the `robotframework-pabot` package

` > pip install -U robotframework-pabot`

Run the below command to execute tests in parallel

`> pabot --processes 2 TestCases\*.robot`

### Save Result Output In Different Directory

`> pabot --processes 2 --outputdir Results TestCases\*.robot`

### Headless Browser Testing

To execute test cases in headless mode, specify the browser name as:
1. For chrome, `headlesschrome`
2. For firefox, `headlessfirefox`


### Docker with Selenium Grid

1. Create a `docker-compose.yml` file containing selenium/hub, selenium/node-chrome, selenium/node-firefox images.
2. Run `docker-compose up` to create and start the docker containers.
3. To check hub and nodes running state: `http://localhost:4444`
4. To increase the number of nodes: `docker-compose scale chrome 3`
5. To stop the containers: `docker-compose down`


## Jenkins Integration (Github)

Create a `requirements.txt` file with all the python packages. It will be used to install all our packages in the virtual environment.
To create the file, run the command: `pip freeze > requirements.txt`

**Plugins Required**
1. ShiningPanda  - To add python support to Jenkins.
2. Robot Framework - To publish robot framework test reports.

**Installing Jenkins**
1. Download `jenkins.war` file.
2. Navigate to file path in cmd and run `java -jar jenkins.war`
3. Setup the jenkins dashboard.
4. Install the required plugins.

**Integration**
1. Create a freestyle project.
2. Select Git in the Source Code Management.
3. Enter the github repository url and select credentials. (If credentials not added then add it)
4. Enter the branch name for the build in Branch Specifier.
5. In the Build section, Click on Add build step and select Custom Python Builder.
6. In Home, enter the python executable path location (run `where python` to find the path).
7. Nature -> Shell
8. Enter the Command to execute:

    ```
   python -m venv env
   call ./env/Scripts/activate.bat
   pip install -r requirements.txt
   robot TestCases\*.robot
   ```
9. In the Post-build actions, select 'Publish Robot framework test results'.
10. Click on Save.
11. Once the project is configured, click on Build Now and it will run the tests.