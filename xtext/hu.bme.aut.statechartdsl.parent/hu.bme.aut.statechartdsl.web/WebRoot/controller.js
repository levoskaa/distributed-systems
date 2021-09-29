var baseUrl = window.location.pathname;
var fileIndex = baseUrl.indexOf("index.html");

if (fileIndex > 0)
	baseUrl = baseUrl.slice(0, fileIndex);

require.config({
	baseUrl: baseUrl,
	paths: {
		"jquery": "webjars/jquery/3.5.1/jquery.min",
		"ace/ext/language_tools": "webjars/ace/1.3.3/src/ext-language_tools",
		"xtext/xtext-ace": "xtext/2.25.0/xtext-ace"
	}
});
require(["webjars/ace/1.3.3/src/ace"], function() {
	require(["xtext/xtext-ace"], function(xtext) {
		var editor = xtext.createEditor({
			baseUrl: baseUrl,
			syntaxDefinition: "xtext-resources/generated/mode-stc.js"
		});

		$('#download-link').click(function() { return false; });

		$('#generate-button').click(function() {
			editor.xtextServices.generate().then(function(result) {
				alert('File generated.')
				$('#download-link').off('click');

				var fileName = 'generated-file.txt';
				var fileContent = result;
				var file = new Blob([fileContent], { type: 'text/plain' });
				
				$('#download-link').attr('href',
				window.URL.createObjectURL(file));
				$('#download-link').attr('download', fileName);
			});
		})
	});
});