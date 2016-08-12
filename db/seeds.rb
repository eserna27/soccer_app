# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Team.find_by(name: "Rayados")
  Teams.save(Teams.create(name: "Rayados", hashtags: "#RayadosDeCorazón", twitter: "@Rayados", logo: "rayados.jpg"), Teams::TeamStore)
end
unless Team.find_by(name: "Tigres")
  Teams.save(Teams.create(name: "Tigres", twitter: "@TigresOficial", hashtags: "#Tigres", logo: "tigres.png"), Teams::TeamStore)
end
unless Team.find_by(name: "Xolos")
  Teams.save(Teams.create(name: "Xolos", twitter: "@Xolos", hashtags: "#Xolos", logo: "xolos.png"), Teams::TeamStore)
end
unless Team.find_by(name: "Monarcas")
  Teams.save(Teams.create(name: "Monarcas", twitter: "@FuerzaMonarca", hashtags: "#Monarcas", logo: "monarcas.png"), Teams::TeamStore)
end
unless Team.find_by(name: "Gallos de Queretaro")
  Teams.save(Teams.create(name: "Gallos de Queretaro", twitter: "@gbqueretaro", hashtags: "#GallosBlancos", logo: "queretaro.png"), Teams::TeamStore)
end
unless Team.find_by(name: "Tiburones Rojos")
  Teams.save(Teams.create(name: "Tiburones Rojos", twitter: "@ClubTiburones", hashtags: "#SiempreTiburón", logo: "tiburones.png"), Teams::TeamStore)
end
unless Team.find_by(name: "Puebla")
  Teams.save(Teams.create(name: "Puebla", twitter: "@PueblaFC", hashtags: "#PonteLaDelPuebla", logo: "puebla.png"), Teams::TeamStore)
end
unless Team.find_by(name: "Atlas")
  Teams.save(Teams.create(name: "Atlas", twitter: "@atlasfc", hashtags: "#SoyFiel", logo: "atlas.png"), Teams::TeamStore)
end
unless Team.find_by(name: "Toluca")
  Teams.save(Teams.create(name: "Toluca", twitter: "@TolucaFC", hashtags: "#SomosDiablos", logo: "toluca.jpg"), Teams::TeamStore)
end
unless Team.find_by(name: "Pachuca")
  Teams.save(Teams.create(name: "Pachuca", twitter: "@Tuzos", hashtags: "#Tuzos", logo: "pachuca.png"), Teams::TeamStore)
end
unless Team.find_by(name: "León")
  Teams.save(Teams.create(name: "León", twitter: "@clubleonfc", hashtags: "#LaFiera", logo: "leon.png"), Teams::TeamStore)
end
unless Team.find_by(name: "Necaxa")
  Teams.save(Teams.create(name: "Necaxa", twitter: "@ClubNecaxa", hashtags: "#FuerzaRayos", logo: "necaxa.png"), Teams::TeamStore)
end
unless Team.find_by(name: "Cruz Azul")
  Teams.save(Teams.create(name: "Cruz Azul", twitter: "@Cruz_Azul_FC", hashtags: "#AzulEsTodo", logo: "cruzazul.png"), Teams::TeamStore)
end
unless Team.find_by(name: "América")
  Teams.save(Teams.create(name: "América", twitter: "@ClubAmerica", hashtags: "#SomosAmerica", logo: "america.png"), Teams::TeamStore)
end
unless Team.find_by(name: "Jaguares")
  Teams.save(Teams.create(name: "Jaguares", twitter: "@Chiapas_FC", hashtags: "#TestigoDelJaguar", logo: "jaguares.png"), Teams::TeamStore)
end
unless Team.find_by(name: "Pumas")
  Teams.save(Teams.create(name: "Pumas", twitter: "@PumasMx", hashtags: "#SoyDePumas", logo: "pumas.png"), Teams::TeamStore)
end
unless Team.find_by(name: "Guadalajara")
  Teams.save(Teams.create(name: "Guadalajara", twitter: "@Chivas", hashtags: "#UnidosSomosCA3RONES", logo: "chivas.png"), Teams::TeamStore)
end
unless Team.find_by(name: "Santos")
  Teams.save(Teams.create(name: "Santos", twitter: "@ClubSantos", hashtags: "#Guerreros", logo: "santos.png"), Teams::TeamStore)
end

if League.find_by(name: "Liga Bancomer")
  Leagues.save(Leagues.create({name: "Liga Bancomer", location: "MX"}), Leagues::LeagueStore)
end

if League.find_by(name: "Liga Bancomer").seasons
  l = League.find_by(name: "Liga Bancomer")
  Seasons.save_season(Seasons.create(name: "Apertura 2016", year: 2016, league: l), Seasons::SeasonStore)
  season = Season.find_by(name: "Apertura 2016")
  Team.all.map { |team|
    SeasonRegistration.create(team: team, season: season)
  }
end
