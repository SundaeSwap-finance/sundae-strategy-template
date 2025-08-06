// we don't have access to randomness, so generate a key from the project name
let key = variable::get("project-name").to_chars().map(|c| {
    let val = c.to_int().to_hex();
    val.pad(2, '0');
    val
}).reduce(|a, b| a + b, "");
key.pad(64, '0');
key.crop(0, 64);

variable::set("private-key", key);