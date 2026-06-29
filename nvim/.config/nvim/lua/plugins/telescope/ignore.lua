return {
  -- Version control
  "%.git/",
  -- JS/TS
  "node_modules/",
  "dist/",
  "build/",
  ".next/",
  ".nuxt/",
  ".svelte%-kit/",
  "%.turbo/",

  -- Python
  "%.venv/",
  "venv/",
  "__pycache__/",
  "%.pytest_cache/",
  "%.mypy_cache/",
  "%.ruff_cache/",
  "dist/",
  "%.egg%-info/",

  -- Rust
  "target/",

  -- Java/Kotlin
  "%.gradle/",
  "%.idea/",
  "out/",

  -- macOS
  "%.DS_Store",

  -- Logs / temp
  "%.log",
  "%.cache/",
  "coverage/",
}
