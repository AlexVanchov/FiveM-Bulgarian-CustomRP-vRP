
-- define all language properties

local lang = {
  common = {
    welcome = "Добре дошли в Bulgarian Custom RP ~n~",
    no_player_near = "~r~Няма играч около вас.",
    invalid_value = "~r~Невалидна сума.",
    invalid_name = "~r~Невалидно име.",
    not_found = "~r~Не е намерено.",
    request_refused = "~r~Заявката е отказана.",
    wearing_uniform = "~r~Внимателно, носите униформа.",
    not_allowed = "~r~Не е позволено."
  },
  weapon = {
    pistol = "Pistol"
  },  
  survival = {
    starving = "starving",
    thirsty = "thirsty"
  },
  money = {
    display = "<span class=\"symbol\">лв</span> {1}",
    bdisplay = "<span class=\"symbol\">лв</span> {1}",
    given = "Given ~r~{1}лв.",
    received = "Получени ~g~{1}лв.",
    not_enough = "~r~Недостатъчно пари.",
    paid = "Платени ~r~{1}лв.",
    give = {
      title = "Прати пари",
      description = "Прати пари на най-близкият играч",
      prompt = "Сума, която да дадете:"
    }
  },
  inventory = {
    title = "Инвентар",
    description = "Отворете инвентара ви",
    iteminfo = "({1})<br /><br />{2}<br /><em>{3} kg</em>",
    info_weight = "тегло {1}/{2} kg",
    give = {
      title = "Дайте",
      description = "Дайте предмети на най-близкия човек.",
      prompt = "Брой (max {1}):",
      given = "Дадени ~r~{1} ~s~{2}.",
      received = "Получени ~g~{1} ~s~{2}.",
    },
    trash = {
      title = "Хвърлете",
      description = "Махнете предмети.",
      prompt = "Брой (max {1}):",
      done = "Изхвърлени ~r~{1} ~s~{2}."
    },
    missing = "~r~Лиспващи {2} {1}.",
    full = "~r~Инвентарът е пълен.",
    chest = {
      title = "Сандък",
      already_opened = "~r~Този сандък вече е отворен от някой друг.",
      full = "~r~Сандъкът е пълен.",
      take = {
        title = "Вземете",
        prompt = "Брой (max {1}):"
      },
      put = {
        title = "Пъхнете",
        prompt = "Брой (max {1}):"
      }
    }
  },
  atm = {
    title = "ATM",
    info = {
      title = "Info",
      bank = "bank: {1} лв"
    },
    deposit = {
      title = "Deposit",
      description = "wallet to bank",
      prompt = "Enter amount of money for deposit:",
      deposited = "~r~{1}лв~s~ deposited."
    },
    withdraw = {
      title = "Withdraw",
      description = "bank to wallet",
      prompt = "Enter amount of money to withdraw:",
      withdrawn = "~g~{1}лв ~s~withdrawn.",
      not_enough = "~r~You don't have enough money in bank."
    }
  },
  business = {
    title = "Chamber of Commerce",
    directory = {
      title = "Directory",
      description = "Business directory.",
      dprev = "> Prev",
      dnext = "> Next",
      info = "<em>capital: </em>{1} лв<br /><em>owner: </em>{2} {3}<br /><em>registration n°: </em>{4}<br /><em>phone: </em>{5}"
    },
    info = {
      title = "Business info",
      info = "<em>name: </em>{1}<br /><em>capital: </em>{2} лв<br /><em>capital transfer: </em>{3} лв<br /><br/>Capital transfer is the amount of money transfered for a business economic period, the maximum is the business capital."
    },
    addcapital = {
      title = "Add capital",
      description = "Add capital to your business.",
      prompt = "Amount to add to the business capital:",
      added = "~r~{1}лв ~s~added to the business capital."
    },
    launder = {
      title = "Money laundering",
      description = "Use your business to launder dirty money.",
      prompt = "Amount of dirty money to launder (max {1} лв): ",
      laundered = "~g~{1}лв ~s~laundered.",
      not_enough = "~r~Not enough dirty money."
    },
    open = {
      title = "Open business",
      description = "Open your business, minimum capital is {1} лв.",
      prompt_name = "Business name (can't change after, max {1} chars):",
      prompt_capital = "Initial capital (min {1})",
      created = "~g~Business created."
      
    }
  },
  cityhall = {
    title = "City Hall",
    identity = {
      title = "Нова самоличност",
      description = "Създайте нова самоличност, струва = {1} лв.",
      prompt_firstname = "Въведете първото ви име:",
      prompt_name = "Въведете последното ви име:",
      prompt_age = "Въведете годините ви:",
    },
    menu = {
      title = "Самоличност",
      info = "<em>Име: </em>{2}<br /><em>Фамилия: </em>{1}<br /><em>Години: </em>{3}<br /><em>Номер на колата n°: </em>{4}<br /><em>Тел: </em>{5}<br /><em>Адрес: </em>{7}, {6}"
    }
  },
  police = {
    title = "Полиция",
    wanted = "Wanted rank {1}",
    not_handcuffed = "~r~Not handcuffed",
    cloakroom = {
      title = "Cloakroom",
      uniform = {
        title = "Uniform",
        description = "Put uniform."
      }
    },
    pc = {
      title = "PC",
      searchreg = {
        title = "Registration search",
        description = "Search identity by registration.",
        prompt = "Enter registration number:"
      },
      closebusiness = {
        title = "Close business",
        description = "Close business of the nearest player.",
        request = "Are you sure to close the business {3} owned by {1} {2} ?",
        closed = "~g~Business closed."
      },
      trackveh = {
        title = "Track vehicle",
        description = "Track a vehicle by its registration number.",
        prompt_reg = "Enter registration number:",
        prompt_note = "Enter a tracking note/reason:",
        tracking = "~b~Tracking started.",
        track_failed = "~b~Tracking of {1}~s~ ({2}) ~n~~r~Failed.",
        tracked = "Tracked {1} ({2})"
      },
      records = {
        show = {
          title = "Show records",
          description = "Show police records by registration number."
        },
        delete = {
          title = "Clear records",
          description = "Clear police records by registration number.",
          deleted = "~b~Police records deleted"
        }
      }
    },
    menu = {
      handcuff = {
        title = "Сложи белезници",
        description = "Сложи белезници/Махни белезници на най-близкият човек."
      },
      putinveh = {
        title = "Пъхни в колата",
        description = "Put the nearest handcuffed player in the nearest vehicle, as passenger."
      },
      getoutveh = {
        title = "Изкарай от колата",
        description = "Get out of vehicle the nearest handcuffed player."
      },
      askid = {
        title = "Поискай лична карта",
        description = "Поискай лична карта на най-близкият човек.",
        request = "Искате ли да си дадете личната карта?",
        request_hide = "Скрийте id-то.",
        asked = "Чакане.."
      },
      check = {
        title = "Проверете човекът",
        description = "Check money, inventory and weapons of the nearest player.",
        request_hide = "Hide the check report.",
        info = "<em>money: </em>{1} лв<br /><br /><em>inventory: </em>{2}<br /><br /><em>weapons: </em>{3}",
        checked = "Вие бивате проверяван."
      },
      seize = {
        seized = "Конфискувай {2} ~r~{1}",
        weapons = {
          title = "Конфискувайте оръжия",
          description = "Seize nearest player weapons",
          seized = "~b~Вашите оръжия бяха конфискувани."
        },
        items = {
          title = "Seize illegals",
          description = "Seize illegal items",
          seized = "~b~Your illegal stuff has been seized."
        }
      },
      jail = {
        title = "Арестувай",
        description = "Jail/UnJail nearest player in/from the nearest jail.",
        not_found = "~r~Не е намерен затвор.",
        jailed = "~b~Арестуван.",
        unjailed = "~b~Освободен.",
        notify_jailed = "~b~Вие бяхте арестуван.",
        notify_unjailed = "~b~Вие бяхте освободен."
      },
      fine = {
        title = "Глоби",
        description = "Fine the nearest player.",
        fined = "~b~Глобен ~s~{2} лв for ~b~{1}.",
        notify_fined = "~b~Вие бяхте глобен ~s~ {2} лв for ~b~{1}.",
        record = "[Fine] {2} лв for {1}"
      },
      store_weapons = {
        title = "Прибери оръжията",
        description = "Store your weapons in your inventory."
      }
    },
    identity = {
      info = "<em>Name: </em>{1}<br /><em>First name: </em>{2}<br /><em>Age: </em>{3}<br /><em>Registration n°: </em>{4}<br /><em>Phone: </em>{5}<br /><em>Business: </em>{6}<br /><em>Business capital: </em>{7} лв<br /><em>Address: </em>{9}, {8}"
    }
  },
  emergency = {
    menu = {
      revive = {
        title = "Съживи",
        description = "Reanimate the nearest player.",
        not_in_coma = "~r~Not in coma."
      }
    }
  },
  phone = {
    title = "Телефон",
    directory = {
      title = "Контакти",
      description = "Open the phone directory.",
      add = {
        title = "➕ Добавете",
        prompt_number = "Enter the phone number to add:",
        prompt_name = "Enter the entry name:",
        added = "~g~Entry added."
      },
      sendsms = {
        title = "Изпратете SMS",
        prompt = "Enter the message (max {1} chars):",
        sent = "~g~ Sent to n°{1}.",
        not_sent = "~r~ n°{1} unavailable."
      },
      sendpos = {
        title = "Send position",
      },
      remove = {
        title = "Remove"
      }
    },
    sms = {
      title = "SMS История",
      description = "Received SMS history.",
      info = "<em>{1}</em><br /><br />{2}",
      notify = "SMS~b~ {1}:~s~ ~n~{2}"
    },
    smspos = {
      notify = "SMS-Position ~b~ {1}"
    },
    service = {
      title = "Служби",
      description = "Обадетете се на някоя служба.",
      prompt = "Въвете съобщение, което службата да види.",
      ask_call = "Получена {1} заявка, заемате ли се ? <em>{2}</em>",
      taken = "~r~Тази заявка е вече приета."
    },
    announce = {
      title = "Обява",
      description = "Post an announce visible to everyone for a few seconds.",
      item_desc = "{1} лв<br /><br/>{2}",
      prompt = "Announce content (10-1000 chars): "
    }
  },
  emotes = {
    title = "Движения",
    clear = {
      title = "> Clear",
      description = "Clear all running emotes."
    }
  },
  home = {
    buy = {
      title = "Buy",
      description = "Buy a home here, price is {1} лв.",
      bought = "~g~Bought.",
      full = "~r~The place is full.",
      have_home = "~r~You already have a home."
    },
    sell = {
      title = "Sell",
      description = "Sell your home for {1} лв",
      sold = "~g~Sold.",
      no_home = "~r~You don't have a home here."
    },
    intercom = {
      title = "Intercom",
      description = "Use the intercom to enter in a home.",
      prompt = "Number:",
      not_available = "~r~Not available.",
      refused = "~r~Refused to enter.",
      prompt_who = "Say who you are:",
      asked = "Asking...",
      request = "Someone wants to open your home door: <em>{1}</em>"
    },
    slot = {
      leave = {
        title = "Leave"
      },
      ejectall = {
        title = "Eject all",
        description = "Eject all home visitors, including you, and close the home."
      }
    },
    wardrobe = {
      title = "Wardrobe",
      save = {
        title = "> Save",
        prompt = "Save name:"
      }
    },
    gametable = {
      title = "Game table",
      bet = {
        title = "Start bet",
        description = "Start a bet with players near you, the winner will be randomly selected.",
        prompt = "Bet amount:",
        request = "[BET] Do you want to bet {1} лв ?",
        started = "~g~Bet started."
      }
    }
  },
  garage = {
    title = "Гараж ({1})",
    owned = {
      title = "Притежавани",
      description = "Owned vehicles."
    },
    buy = {
      title = "Купи",
      description = "Buy vehicles.",
      info = "{1} лв<br /><br />{2}"
    },
    sell = {
      title = "Продай",
      description = "Sell vehicles."
    },
    rent = {
      title = "Поднаем",
      description = "Rent a vehicle for the session (until you disconnect)."
    },
    store = {
      title = "Прибери",
      description = "Put your current vehicle in the garage."
    }
  },
  vehicle = {
    title = "Автомобил",
    no_owned_near = "~r~Нямате автомобил наоколо.",
    trunk = {
      title = "Багажник",
      description = "Open the vehicle trunk."
    },
    detach_trailer = {
      title = "Detach trailer",
      description = "Detach trailer."
    },
    detach_towtruck = {
      title = "Detach tow truck",
      description = "Detach tow truck."
    },
    detach_cargobob = {
      title = "Detach cargobob",
      description = "Detach cargobob."
    },
    lock = {
      title = "Отключете/заключете",
      description = "Lock or unlock the vehicle."
    },
    engine = {
      title = "Двигател on/off",
      description = "Start or stop the engine."
    },
    asktrunk = {
      title = "Отвори багажника.",
      asked = "~g~Питане...",
      request = "Искате ли да отворите багажникът ?"
    },
    replace = {
      title = "Replace vehicle",
      description = "Replace on ground the nearest vehicle."
    },
    repair = {
      title = "Поправете превозното средство",
      description = "Repair the nearest vehicle."
    },
    sellTP = {
  title = "Продайте на играч",
  description = "Sell the nearest vehicle to a player."
    }
  }, 
  gunshop = {
    title = "Gunshop ({1})",
    prompt_ammo = "Amount of ammo to buy for the {1}:",
    info = "<em>body: </em> {1} лв<br /><em>ammo: </em> {2} лв/u<br /><br />{3}"
  },
  market = {
    title = "Market ({1})",
    prompt = "Amount of {1} to buy:",
    info = "{1} лв<br /><br />{2}"
  },
  skinshop = {
    title = "Skinshop"
  },
  cloakroom = {
    title = "Cloakroom ({1})",
    undress = {
      title = "> Undress"
    }
  },
  itemtr = {
    informer = {
      title = "Illegal Informer",
      description = "{1} лв",
      bought = "~g~Position sent to your GPS."
    }
  },
  mission = {
    blip = "Mission ({1}) {2}/{3}",
    display = "<span class=\"name\">{1}</span> <span class=\"step\">{2}/{3}</span><br /><br />{4}",
    cancel = {
      title = "Откажи Мисията"
    }
  },
  aptitude = {
    title = "Aptitudes",
    description = "Show aptitudes.",
    lose_exp = "Aptitude ~b~{1}/{2} ~r~-{3} ~s~exp.",
    earn_exp = "Aptitude ~b~{1}/{2} ~g~+{3} ~s~exp.",
    level_down = "Aptitude ~b~{1}/{2} ~r~lose level ({3}).",
    level_up = "Aptitude ~b~{1}/{2} ~g~level up ({3}).",
    display = {
      group = "{1}: ",
      aptitude = "--- {1} | exp {2} | lvl {3} | progress {4}%"
    }
  }
}

return lang
