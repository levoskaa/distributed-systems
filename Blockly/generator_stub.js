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

Blockly.JavaScript['for_loop_block'] = function (block) {
    var variable_loop_var = Blockly.JavaScript.variableDB_.getName(block.getFieldValue('loop_var'), Blockly.Variables.NAME_TYPE);
    var number_from_input = block.getFieldValue('from_input');
    var number_to_input = block.getFieldValue('to_input');
    var number_by_input = block.getFieldValue('by_input');
    var statements_loop_blocks = Blockly.JavaScript.statementToCode(block, 'loop_blocks');

    var comparison;
    var operation = `${variable_loop_var}`;
    if (number_from_input <= number_to_input) {
        comparison = '<=';
        if (number_by_input == 1) {
            operation += '++';
        } else {
            operation += `+=${number_by_input}`;
        }
    } else {
        comparison = '>=';
        if (number_by_input == 1) {
            operation += '--';
        } else {
            operation += `-=${number_by_input}`;
        }
    }

    var code = `for (${variable_loop_var}=${number_from_input};`
        + `${variable_loop_var}${comparison}${number_to_input};`
        + `${operation}) {\n`
        + statements_loop_blocks
        + '}\n';
    return code;
};

Blockly.JavaScript['number_block'] = function (block) {
    var number_num = block.getFieldValue('num');
    var code = number_num;
    return [code, Blockly.JavaScript.ORDER_ATOMIC];
};

Blockly.JavaScript['cylinder_block'] = function (block) {
    var colour_colour = block.getFieldValue('colour');
    var value_height = Blockly.JavaScript.valueToCode(block, 'height', Blockly.JavaScript.ORDER_ATOMIC);
    var value_radius = Blockly.JavaScript.valueToCode(block, 'radius', Blockly.JavaScript.ORDER_ATOMIC);
    var value_x = Blockly.JavaScript.valueToCode(block, 'x', Blockly.JavaScript.ORDER_ATOMIC);
    var value_y = Blockly.JavaScript.valueToCode(block, 'y', Blockly.JavaScript.ORDER_ATOMIC);
    var value_z = Blockly.JavaScript.valueToCode(block, 'z', Blockly.JavaScript.ORDER_ATOMIC);

    var sceneEl = document.querySelector('a-scene');
    var entityEl = document.createElement('a-entity');
    entityEl.setAttribute('position', { x: 1, y: 2, z: -3 });
    // Do `.setAttribute()`s to initialize the entity.
    sceneEl.appendChild(entityEl);

    var code = '...;\n';
    return code;
};