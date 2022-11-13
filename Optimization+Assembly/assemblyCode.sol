// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.4.26;

contract Assembly{

    function normalLoop() public view returns(uint result){
        for(uint i = 0; i < 10; i++){
            result += i;
        }
    }

    function assemblyLoop() public view returns(uint result){
        assembly{
            let i := 0
            loop:
                result := add(result, i)
                i := add(i, 1)
                jumpi(loop, lt(i, 10))
        }
    }

    function normalIf(uint num1, uint num2) public view returns(uint result){
        if(num1 > num2){
            result = num1;
        } else{
            result = num2;
        }
        return result;
    }

    function assemblyIf(uint num1, uint num2) public view returns(uint result){
        assembly{
            jumpi(num1Greater, gt(num1, num2))
            jump(num2Greater)

            num1Greater:
                result := num1
                jump(end)
            num2Greater:
                result := num2
            end:


        }
    }

    function instrAssemblyLoop() public view returns(uint result){
        0 // push i to stack
        10 // push count to stack

        loop:
            // result := add(result, i)
            dup3 // push result to stack
            dup3 // push i to stack
            add // add (result, i)
            swap3 // set the new value of result
            pop // pop old value of result

            // i := add(i, 1)
            dup2 // push i to stack 
    }

    // memory

    function normalSumOfArray(uint[] arr) public view returns (uint sum){
        for(uint i = 0; i < arr.length; i++) {
            sum = arr[i] + sum;
        }
    }

    function asmSumOfArray(uint[] arr) public view returns(uint sum){
        assembly {
            let len := mload(arr)
            let elAddress := add(arr, 0x20)
            let i := 0

            loop:
                sum := add(sum, mload(elAddress))
                elAddress := (add(elAddress, 0x20))

                i := add(i, 1)
                jumpi(loop, lt(i, len))
        }
    }

    function normalScaleArray(uint[] arr) public view returns (uint[] result){
        for (uint i = 0; i < arr.length; i++){
            arr[i] = arr[i] * 2;
        }
        return arr;
    }

    function asmScaleArray(uint[] arr) public view returns (uint[] result){
        assembly{
            let len := mload(arr)
            let elAddress := add(arr, 0x20)
            let i:- 0
            let element := 0

            mstore(0x0, 0x20) // store the data in mem[0]. 0x20 mean one-dimensional dynamic array
            mstore(0x20, len) // store he length in mem[1]

            loop:
                element := mload(elAddress)
                element := mul(element, 2)

                // store element i in mem[2 + i]
                mstore(add(0x40, mul(i, 0x20)), element)

                elAddress := add(elAddress, 0x20)
                
                i := add(i, 1)
                jumpi(loop, lt(i, len))
            
            // return mem[0....len + 2]
            return(0x0, add(0x40, mul(len, 0x20)))
        }
    }

}

contract StorageOperationsDemo{

    // storage

    uint public x;
    uint public y;

    function setX(uint value) public{
        assembly{
            sstore(add(x_slot, x_offset), value)
        }
    }

    function setY(uint value) public{
        assembly{
            sstore(add(y_slot, y_offset), value)
        }
    }

    function swapXY() public{
        assembly {
            let temp := sload(add(x_slot, x_offset))
            let yVal := sload(add(y_slot, y_offset))
            sstore(add(x_slot, x_offset), yVal)

            sstore(add(y_slot, y_offset), temp)
        }
    }
}

contract CallDataDemo{

    
    // calldata

    function sumArrayPublic(uint[] arr) public view returns(uint){
        uint sum = 0;
        for (uint i = 0; i < arr.length; i++){
            sum += arr[i];
        }

        return sum;
    }
      function sumArrayExternal(uint[] arr) external view returns(uint){
        uint sum = 0;
        for (uint i = 0; i < arr.length; i++){
            sum += arr[i];
        }

        return sum;
    }

     function scaleArrayPublic(uint[] arr) public returns (uint[]){
        for (uint i = 0; i < arr.length; i++){
            arr[i] *= 2;
        }

        return arr;
    }

    function scaleArrayExternal(uint[] arr) external returns (uint[]){
        for (uint i = 0; i < arr.length; i++){
            // This will not work. calldata is read-only in external functions
            // cannot modify function parameters
            arr[i] *= 2;
        }

        return arr;
    }
}
