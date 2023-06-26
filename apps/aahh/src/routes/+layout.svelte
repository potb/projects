<script lang="ts">
  import { pwaInfo } from 'virtual:pwa-info';

  $: webManifestLink = pwaInfo ? pwaInfo.webManifest.linkTag : '';
</script>

<svelte:head>
  <title>aahh</title>
  <meta
    name="description"
    content="A website to play the goofy aahh sound effect clicking on Philippe Etchebest's face"
  />
  {@html webManifestLink}
</svelte:head>

<slot />
