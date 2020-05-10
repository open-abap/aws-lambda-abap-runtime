const transpiler = require('@abaplint/transpiler');

exports.transpile = async function (filename, source) {
	const t = new transpiler.Transpiler();
  const result = await t.run([{ filename: filename, contents: source }]);
  return result.js[0].contents;
};
