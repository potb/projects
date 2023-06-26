declare global {
  import 'vite/client';

  namespace App {}

  declare module '*?meta' {
    export const src: string;

    export const width: number;

    export const height: number;
  }

  declare module '*&meta' {
    export const src: string;

    export const width: number;

    export const height: number;
  }
}
