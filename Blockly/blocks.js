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