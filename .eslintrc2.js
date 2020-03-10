module.exports = {
  env: {
    browser: true
  },
  parserOptions: {
    sourceType: 'module'
  },
  settings: {
    'import/resolver': {
      webpack: {
        config: './config/webpack/development.js'
      }
    }
  }
}