Blockly.JavaScript['print'] = function (block) {
    var value_input = Blockly.JavaScript.valueToCode(block, 'input', Blockly.JavaScript.ORDER_ATOMIC);
    var code = `alert(${value_input});\n`;
    return code;
};

Blockly.JavaScript['text_input'] = function (block) {
    var text_parameter = block.getFieldValue('parameter');
    var code = `"${text_parameter}"`;
    return [code, Blockly.JavaScript.ORDER_ATOMIC];
};

Blockly.JavaScript['repeat_block'] = function (block) {
    var loop_var = block.getFieldValue('loop_var');
    var statements_loop_blocks = Blockly.JavaScript.statementToCode(block, 'loop_blocks');
    var code = 'var repeats = 0;\n' +
        `while (repeats < ${loop_var}) {\n` +
        statements_loop_blocks +
        'repeats++;\n' +
        '}\n';
    return code;
};