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