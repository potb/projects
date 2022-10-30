import { defineConfig } from 'vite';

export const rootConfig = (appName: string) =>
  defineConfig({
    root: `apps/${appName}`,
    build: {
      outDir: `../../dist/apps/${appName}`,
      emptyOutDir: true,
      reportCompressedSize: true,
    },
  });
