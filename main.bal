import ballerina/http;
import ballerina/os;
import ballerina/io;

service /testBal on new http:Listener(9090) {
    resource function get testBal() returns string|os:Error|error {
        os:Process result = check os:exec({
            value: "python3",
            arguments: ["test.py"]
        });

        int status = check result.waitForExit();
        io:println(string `Process exit with status: ${status}`);

        byte[] output = check result.output(io:stdout);
        io:println(check string:fromBytes(output));

        return "d!";
    }
}

