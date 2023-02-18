*** Settings ***
Library           Selenium2Library
Library           Collections
Library           BuiltIn
Library           ExcelLibrary
Library           OperatingSystem

*** Test Cases ***
TC1
    OPEN BROWSER    https://www.apoteket.se/    CHROME
    maximize browser window
    click button    //button[text()="Tillåt alla cookies"]
    wait until element is visible    //*[contains(@class,"input-0-2-")]    20s
    input text    //*[contains(@class,"input-0-2-")]    xarelto
    press keys    //*[contains(@class,"input-0-2-")]    ENTER
    wait until element is visible    (//*[contains(@class,"productName-")]/span)[1]
    ${Product_Name1}    get text    (//*[contains(@class,"productName-")]/span)[1]
    ${Product_Name2}    get text    (//*[contains(@class,"productName-")]/span)[2]
    ${Price1}    get text    (//*[contains(@class,"productPrice-")])[1]
    ${Price2}    get text    (//*[contains(@class,"productPrice-")])[2]
    Empty Directory    C:\\Users\\Akash\\Desktop\\RobotFramework\\Result_File
    ExcelLibrary.Create Excel Document    docname
    Comment    ExcelLibrary.Open Excel Document    C:\\Users\\Akash\\Desktop\\RobotFramework\\Sample1.xlsx    Product Details
    ExcelLibrary.Write Excel Cell    1    1    Product Name
    ExcelLibrary.Write Excel Cell    1    2    Product Price
    ExcelLibrary.Write Excel Cell    2    1    ${Product_Name1}
    ExcelLibrary.Write Excel Cell    3    1    ${Product_Name2}
    ExcelLibrary.Write Excel Cell    2    2    ${Price1}
    ExcelLibrary.Write Excel Cell    3    2    ${Price2}
    ExcelLibrary.Save Excel Document    C:\\Users\\Akash\\Desktop\\RobotFramework\\Result_File\\Sample1.xlsx
    ExcelLibrary.Close All Excel Documents

TC2
    Comment    ExcelLibrary.Open Excel Document    C:\\RobotFramework\\Sample1.xlsx    Product Details
    Comment    ${Vlaue}    Read Excel Cell    1    1
    ExcelLibrary.Create Excel Document    docname
    ExcelLibrary.Write Excel Cell    1    1    Product Name
    ExcelLibrary.Write Excel Cell    1    2    Product Price
    ExcelLibrary.Save Excel Document    C:\\Users\\Akash\\Desktop\\RobotFramework\\Sample2.xlsx
    ExcelLibrary.Close All Excel Documents
