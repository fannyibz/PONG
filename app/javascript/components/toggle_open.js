
const getOpenStatus = () => {
  const toggle = document.querySelector(".switch");
  const input = document.querySelector("#toggle-value");

  toggle.addEventListener('change', e => {
    input.value = input.value === '1' ? '0': '1'
  })
}

export { getOpenStatus }
