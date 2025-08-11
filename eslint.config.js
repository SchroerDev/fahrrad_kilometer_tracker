import js from '@eslint/js'
import pluginVue from 'eslint-plugin-vue'
import prettier from '@vue/eslint-config-prettier'

export default [
  // Base JavaScript rules
  js.configs.recommended,

  // Vue.js rules for all .vue files
  ...pluginVue.configs['flat/recommended'],

  // Prettier integration (must be last)
  prettier,

  // Ignore patterns
  {
    ignores: ['docs/**', 'dist/**', 'node_modules/**', '*.min.js', 'supabase/**'],
  },

  {
    files: ['**/*.{js,mjs,vue}'],
    languageOptions: {
      ecmaVersion: 'latest',
      sourceType: 'module',
      globals: {
        // Node.js globals for config files
        process: 'readonly',
        __dirname: 'readonly',
        __filename: 'readonly',
        // Browser globals
        console: 'readonly',
        window: 'readonly',
        document: 'readonly',
        navigator: 'readonly',
        localStorage: 'readonly',
        sessionStorage: 'readonly',
      },
    },
    rules: {
      // Vue 3 Composition API specific rules
      'vue/multi-word-component-names': 'off', // Allow single word component names
      'vue/component-api-style': ['error', ['script-setup']], // Prefer script setup
      'vue/component-name-in-template-casing': ['error', 'PascalCase'],
      'vue/define-macros-order': [
        'error',
        {
          order: ['defineOptions', 'defineProps', 'defineEmits', 'defineSlots'],
        },
      ],

      // General JavaScript rules
      'no-console': 'warn', // Warn instead of error for console statements
      'no-debugger': 'error',
      'no-unused-vars': [
        'error',
        {
          argsIgnorePattern: '^_',
          varsIgnorePattern: '^_',
        },
      ],
      'prefer-const': 'error',
      'no-var': 'error',

      // Code style rules (Prettier will handle most formatting)
      eqeqeq: ['error', 'always'],
      curly: ['error', 'all'],
      semi: ['error', 'never'], // Match project style (no semicolons)
    },
  },

  {
    files: ['vite.config.js', 'vitest.config.js', 'eslint.config.js'],
    languageOptions: {
      globals: {
        process: 'readonly',
        __dirname: 'readonly',
        __filename: 'readonly',
      },
    },
  },
]
