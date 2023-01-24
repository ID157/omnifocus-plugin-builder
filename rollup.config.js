const typescript = require('@rollup/plugin-typescript')
const nodeResolve = require('@rollup/plugin-node-resolve')

exports.default = {
	input: {
    'record-start': 'scripts/record-task-start.ts'
  },
	output: {
		dir: './dist',
		format: 'es'
	},
  plugins: [
    typescript(),
    nodeResolve()
  ],
};
