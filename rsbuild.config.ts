import { createConfig } from '@nx/angular-rsbuild';

const config = await createConfig({
  options: {
    browser: './src/main.ts'
  }
});

export default config;

/*
export default createConfig({
  options: {
    browser: './src/main.ts'
  }
});
*/
