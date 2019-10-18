import Razor (interpret, pretty, Razor(..))
import Pyramid (longestSlideDown)
import WordWrap (wrap)

doRazor :: IO ()
doRazor = do
  print . interpret $ Lit 3
  print . interpret $ Add (Lit 3) (Lit 4)
  print . interpret $ Add (Lit 5) (Add (Lit 3) (Lit 4))
  print . interpret $ Add (Lit 5) (Mul (Lit 3) (Lit 4))
  print . interpret $ Add (Lit 2) (Cat (Lit 4) (Lit 2))

  putStrLn . pretty $ Lit 3
  putStrLn . pretty $ Add (Lit 3) (Lit 4)
  putStrLn . pretty $ Add (Lit 5) (Add (Lit 3) (Lit 4))

doPyramid :: IO ()
doPyramid = do
  print . longestSlideDown $ []
  print . longestSlideDown $ [[42]]
  print . longestSlideDown $ [[3], [7, 4], [2, 4, 6], [8, 5, 9, 3]]
  print . longestSlideDown $ [[3], [7, 4], [2, 4, 6], [200, 5, 9, 3]]

doWrap :: IO ()
doWrap = do
  putStrLn $ wrap "No one would have believed in the last years of the nineteenth century that this world was being watched keenly and closely by intelligences greater than man’s and yet as mortal as his own; that as men busied themselves about their various concerns they were scrutinised and studied, perhaps almost as narrowly as a man with a microscope might scrutinise the transient creatures that swarm and multiply in a drop of water. With infinite complacency men went to and fro over this globe about their little affairs, serene in their assurance of their empire over matter. It is possible that the infusoria under the microscope do the same. No one gave a thought to the older worlds of space as sources of human danger, or thought of them only to dismiss the idea of life upon them as impossible or improbable. It is curious to recall some of the mental habits of those departed days. At most terrestrial men fancied there might be other men upon Mars, perhaps inferior to themselves and ready to welcome a missionary enterprise. Yet across the gulf of space, minds that are to our minds as ours are to those of the beasts that perish, intellects vast and cool and unsympathetic, regarded this earth with envious eyes, and slowly and surely drew their plans against us. And early in the twentieth century came the great disillusionment." 40

main :: IO ()
main = do
  putStrLn "Hutton's Razor"
  doRazor

  putStrLn ""
  putStrLn "Pyramid Slide Down"
  doPyramid

  putStrLn ""
  putStrLn "Word Wrap"
  doWrap