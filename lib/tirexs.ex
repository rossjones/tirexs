defmodule Tirexs do

  def init_index(type_name_list) do
    type_name_list
  end


  def do_query(settings, url, params) do
    json = JSON.encode(params)
    url = "#{url}/_search"
    Tirexs.ElasticSearch.post(url, json, settings)
  end

  def do_search(settings, search) do
    url = case search[:type] do
      nil -> "#{search[:name]}/_search"
      type -> "#{search[:name]}/#{type}/_search"
    end
    do_query(settings, url, search[:search])
  end
end