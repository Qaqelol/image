defmodule ForDialyzer do
  # Juse to exorcise dialyzer errors. This module is not included
  # in the library.

  def compose do
    small_kip = Image.open!("./test/support/images/Kip_small.jpg")

    texts = [
      {Image.Text.text!("hello", text_fill_color: :darkslategray, padding: 10), x: :center, y: :middle},
      {Image.Text.text!("world", text_fill_color: :darkslategray, padding: 10), dy: 12}
    ]

    Image.compose!(small_kip, texts)
  end

  def embed do
    penguin = Image.open!("./test/support/images/penguin_with_alpha.png")
    {width, height, _bands} = Image.shape(penguin)

    {:ok, _embed_1} = Image.embed(penguin, width, height + 50, extend_mode: :black)
    {:ok, _embed_1} = Image.embed(penguin, width, height + 50, x: 0, y: 0, extend_mode: :black, background_transparency: :transparent)
    {:ok, _embed_1} = Image.embed(penguin, width, height + 50, x: 0, y: 0, extend_mode: :black, background_transparency: :opaque)
    {:ok, _embed_1} = Image.embed(penguin, width, height + 50, x: 0, y: 0, extend_mode: :background, background: :green)

  end
end