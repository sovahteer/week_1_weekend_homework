def pet_shop_name (pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, cash)
  pet_shop[:admin][:total_cash] += cash
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, cash)
  pet_shop[:admin][:total_cash] += cash
  return pet_shop[:admin][:total_cash]
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, sold)
  pet_shop[:admin][:pets_sold] += sold
  return pet_shop[:admin][:pets_sold]
end

def stock_count(pet_shop)
  return pet_shop[:pets].length
end

def pets_by_breed(pet_shop, breed)
  results = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed
     results << pet
   end
  end
  return results
end

def find_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if pet[:name] == name
      return pet
    end
  end
  return nil
end

def remove_pet_by_name (pet_shop, name)
  pets =  pet_shop[:pets]
  pet = find_pet_by_name(pet_shop, name)
  pets.delete(pet)
end

def add_pet_to_stock (pet_shop, new_pet)
  pet_shop[:pets] << new_pet
end

def customer_cash (customer)
  return customer[:cash]
end

def remove_customer_cash(customer, cash)
  customer[:cash] -= cash
  return customer[:cash]
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer, pet)
    customer[:pets] << pet
end

# OPTIONAL

def customer_can_afford_pet(customer,pet)
  return customer[:cash] >= pet[:price]
end

def add_to_pet_sold(admin, pet)
  admin[:pets_sold] << pet
end

def sell_pet_to_customer(pet_shop, pet, customer)
  if pet == nil
    return false
  end
  if !customer_can_afford_pet(customer, pet)
    return
  end
  remove_pet_by_name(pet_shop, pet[:name])
  remove_customer_cash(customer, pet[:price])
  increase_pets_sold(pet_shop, 1)
  add_or_remove_cash(pet_shop, pet[:price])
  add_pet_to_customer(customer, pet)
end
