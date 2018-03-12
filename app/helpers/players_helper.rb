module PlayersHelper

  def full_name(player)
    "#{player.first_name} #{player.surname}"
  end
end
