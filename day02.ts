import { runDay } from "./common/input.ts";
// 2*l*w + 2*w*h + 2*h*l
function solvePart1(input : string): number | string {
  const lines = input.split(`\n`);
  let total = 0;
  let l;
  for(l of lines) {
    const [L, W, H] = l.split('x').map(Number);
    // console.log(L,W,H);
    const s = Math.min(...[L*W,W*H,H*L]);
    total += (((2*L*W) + (2*W*H) + (2*H*L)) + s);
  }
  return total
}

function solvePart2(input : string): number | string {
  const lines = input.split(`\n`);
  let total = 0;
  let l;
  for(l of lines) {
    const [L, W, H] = l.split('x').map(Number);
    // console.log(L,W,H);
    const s = Math.min(...[L+W,W+H,H+L]);
    total += ((2*s) + (L*H*W));
  }
  return total
}

if (import.meta.main) {
  await runDay(2, solvePart1, solvePart2);
}