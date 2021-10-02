Blockly.Blocks['print'] = {
    init: function () {
        this.appendValueInput("input")
            .setCheck("String")
            .appendField("print");
        this.setInputsInline(true);
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setColour(230);
        this.setTooltip("This block displays an alert box with a specified message and an OK button.");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['text_input'] = {
    init: function () {
        this.appendDummyInput()
            .appendField("\"")
            .appendField(new Blockly.FieldTextInput("text"), "parameter")
            .appendField("\"");
        this.setInputsInline(true);
        this.setOutput(true, "String");
        this.setColour(180);
        this.setTooltip("This block represents a text input.");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['repeat_block'] = {
    init: function () {
        this.appendDummyInput()
            .appendField("repeat")
            .appendField(new Blockly.FieldNumber(0, 0), "loop_var")
            .appendField("times");
        this.appendStatementInput("loop_blocks")
            .setCheck(null)
            .appendField("do");
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setColour(180);
        this.setTooltip("This block can repeat the embedded blocks.");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['for_loop_block'] = {
    init: function () {
        this.appendDummyInput()
            .appendField("count with")
            .appendField(new Blockly.FieldVariable("i"), "loop_var")
            .appendField("from")
            .appendField(new Blockly.FieldNumber(0), "from_input")
            .appendField("to")
            .appendField(new Blockly.FieldNumber(0), "to_input")
            .appendField("by")
            .appendField(new Blockly.FieldNumber(0, 0), "by_input");
        this.appendStatementInput("loop_blocks")
            .setCheck(null)
            .appendField("do");
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setColour(180);
        this.setTooltip("This block represents a traditional for loop.");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['number_block'] = {
    init: function () {
        this.appendDummyInput()
            .appendField(new Blockly.FieldNumber(0), "num");
        this.setOutput(true, "Number");
        this.setColour(225);
        this.setTooltip("This block represents a number block.");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['cylinder_block'] = {
    init: function () {
        this.appendDummyInput()
            .appendField("CYLINDER")
            .appendField(new Blockly.FieldColour("#ff0000"), "colour");
        this.appendValueInput("height")
            .setCheck("Number")
            .appendField("height");
        this.appendValueInput("radius")
            .setCheck("Number")
            .appendField("radius");
        this.appendValueInput("x")
            .setCheck("Number")
            .appendField("x");
        this.appendValueInput("y")
            .setCheck("Number")
            .appendField("y");
        this.appendValueInput("z")
            .setCheck("Number")
            .appendField("z");
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setColour(230);
        this.setTooltip("This block represents a cylinder.");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['reverse_sign_block'] = {
    init: function () {
        this.appendDummyInput()
            .appendField("reverse sign of")
            .appendField(new Blockly.FieldVariable("variable"), "number");
        this.setInputsInline(false);
        this.setOutput(true, "Number");
        this.setColour(330);
        this.setTooltip("This block reverses the sign of a number.");
        this.setHelpUrl("");
    }
};