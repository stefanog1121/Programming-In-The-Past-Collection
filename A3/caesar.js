function shiftChar(shift, c) {
    if (c.charCodeAt(0) >= 65 && c.charCodeAt(0) <= 90) {
        return String.fromCharCode(65 + (((c.charCodeAt(0) - 65 + shift) % 26 + 26) % 26));
    }
    else {
        return c;
    }
}

function encrypt(shift, str) {
    let s = str.toUpperCase();

    if (s.length === 0) {
        return "";
    } else if (s.length === 1) {
        return shiftChar(shift, s);
    } 
    else {
        return shiftChar(shift, s[0]) + encrypt(shift, s.slice(1));
    }
}

function decrypt(shift, str) {
    return encrypt(-shift, str);
}

function solveHelper(str, shift, results = []) {
    if (shift === 27) {
        return results;
    }
    else {
        let shifted = encrypt(shift, str);
        return solveHelper(str, shift + 1, [...results, shifted]);
    }
}

function solve(str) {
    let allShifts = solveHelper(str, 0);
    allShifts.forEach((index, shift) => {
        console.log(`Shift ${shift}: ${index}`);
    });
}

// main
let input = "Operation Daybreak!";
console.log("Original: " + input);

let encrypted = encrypt(2, input);
console.log("Encrypted: " + encrypted);

let decrypted = decrypt(2, encrypted);
console.log("Decrypted: " + decrypted);

solve('Hal');