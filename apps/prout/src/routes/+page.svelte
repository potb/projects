<script lang="ts">
  import fartSrc from '$lib/assets/fart.mp3';
  import {
    src,
    width,
    height,
  } from '$lib/assets/butt.png?format=webp&h=838&w=334&quality=70&as=meta';

  const fart = async (): Promise<void> => {
    await new Audio(fartSrc).play();
  };
</script>

<h1>prout</h1>
<img
  {src}
  {width}
  {height}
  useMap="#butt"
  alt="Myd butt-naked, seen from behind"
/><button on:click={fart}>
  <map name="butt">
    <area
      alt="Accurate mapping of Myd butt"
      coords="99,468,77,455,67,430,69,412,86,412,105,407,125,400,131,415,137,430,136,451,123,458,114,466"
      shape="poly"
    />
  </map>
</button>

<style>
  button {
    border: none;
    background: none;
  }
</style>
