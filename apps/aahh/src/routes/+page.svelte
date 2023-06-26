<script lang="ts">
  import {
    src,
    width,
    height,
  } from '$lib/assets/philippe.png?format=webp&w=400&h=400&quality=60&meta';

  const audios = Object.values(
    import.meta.glob<string>('$lib/assets/aahh_*.mp3', {
      eager: true,
      as: 'url',
    })
  );

  const aahh = async (): Promise<void> => {
    const random = Math.floor(Math.random() * audios.length);
    const randomAudio = audios[random];

    await new Audio(randomAudio).play();
  };
</script>

<h1>aahh</h1>
<button on:click={aahh}>
  <img {src} {width} {height} alt="Philippe Etchebest with his mouth open" />
</button>

<style>
  button {
    border: none;
    background: none;
    cursor: pointer;
  }

  * {
    user-select: none;
  }
</style>
