*** Test Cases ***
For Loop Test
    FOR   ${i}    IN RANGE    1   10
    LOG TO CONSOLE    ${i}
    END

For Loop with List
    @{items}    create list    java    python    javascript    php    c#    c++    rust
    FOR    ${item}    IN    @{items}
        log to console    ${item}
    END

For Loop with Evaluate and IF
    @{items}    create list    java    python    javascript    php    c#    c++    rust
    ${index}    set variable    1
    FOR    ${item}    IN    @{items}
        exit for loop if    ${index} > 3
        log to console    ${item}
        ${index} =    evaluate    ${index} + 1
    END