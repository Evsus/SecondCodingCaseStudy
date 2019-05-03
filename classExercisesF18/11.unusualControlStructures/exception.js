// Illustrates unusual excecution path due to thrown exception.
// To run in c9: `node exception`

a();

function a() {
    console.log("starting a");
    try {
        b();
    } catch(exception) {
        console.log(exception);
    }
    console.log("finishing a");
}

function b() {
    console.log("starting b");
    c();
    console.log("finishing b");
}

function c() {
    console.log("starting c");
    throw "There was an error.";
    console.log("finishing c");
}
