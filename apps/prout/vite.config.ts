import { defineConfig } from 'vite';
import { rootConfig } from '../../vite.config';
import react from '@vitejs/plugin-react';

export default defineConfig({
  ...rootConfig('prout'),

  plugins: [react()],
});
