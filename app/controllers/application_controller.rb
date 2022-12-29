class ApplicationController < Sinatra::Base

  set :default_content_type, "application/json"

  # add routes
  get '/bakeries' do
    # "<h2>Hello world!</h2>"
    bakeries = Bakery.all

    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])

    bakery.to_json(include: :baked_goods )
  end

  get '/baked_goods/by_price' do
    baked_goods = BakedGood.all.order('price DESC' )

    baked_goods.to_json

  end

  get '/baked_goods/most_expensive' do
    priciest_baked_good = BakedGood.all.order(price: :DESC).first

    priciest_baked_good.to_json
  end
end
