//  SPDX-License-Identifier: GPL-3.0

pragma  solidity >=0.7.0 < 0.9.0;

//I got about halfway thru this one. had trouble with some of restrictions and specifics

contract PlanetEarth {
    string currentContinent = "Europe";
    string[7] continents = ["North America", "South America", "Africa", "Asia", "Europe", "Antartica", "Australia"];
    Country[] public countries;

    struct Country{
        string name;
        string continent;
        uint population;
    }

    Country country;

	function CreateCountry(string memory _name, string memory _continent, uint _population) public {
        
        country.name =_name;
        country.continent = _continent;
        country.population = _population;

        countries.push(country);
    }

    mapping(string => string)capitals;

    function setCapital(string memory key, string memory capital) public{
        capitals[key] = capital;
    }

     function getCapital(string memory key) public view returns (string memory){
        mapping(string => string) storage cap = capitals;
        return cap[key];
    }

      function deleteCapital(string memory key) public returns (string memory){
        mapping(string => string) storage cap = capitals;
        delete(cap[key]);
        return "Deleted Captital";
    }

    function getContinent(uint index) public view returns (string memory){
        return continents[index];
    }

}