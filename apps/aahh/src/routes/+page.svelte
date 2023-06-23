<script lang="ts">
  const aahh = async (): Promise<void> => {
    const random = Math.floor(Math.random() * 2);

    await new Audio(`/aahh_${random}.mp3`).play();
  };
</script>

<div>
  <h1>aahh</h1>
  <button on:click={aahh}>
    <img src="/philippe.png" alt="Philippe Etchebest with his mouth open" />
  </button>
</div>

<style>
  button {
    border: none;
    background: none;
    cursor: pointer;
  }
</style>
