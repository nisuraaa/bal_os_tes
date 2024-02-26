import ballerina/io;
import ballerina/os;

public function main() {
    io:println("Hello, World!");
    os:Process|os:Error result = os:exec({value: "python3", arguments: ["test.py"]});
}
