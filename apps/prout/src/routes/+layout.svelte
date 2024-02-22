<script lang="ts">
  import slip from '$lib/assets/slip.png?format=webp&h=32&w=32&as=meta';
</script>

<svelte:head>
  <title>prout</title>
  <meta name="description" content="A website to fart clicking on Myd's butt" />
</svelte:head>

<main style="cursor: url({slip.src}), auto;">
  <slot />
</main>

<style>
    * {
        user-select: none;
    }
</style>
