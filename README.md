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