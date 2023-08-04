select *
from PortfolioProject.dbo.coviddeaths
order by 3,4
--select *
--from PortfolioProject.dbo.CovidVaccinations
--order by 3,4
select Location, date, total_cases,new_cases, total_deaths, population
from PortfolioProject.dbo.coviddeaths
order by 1,2
-- Checking Cases vs Deaths
select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathsPecentage
from PortfolioProject.dbo.coviddeaths
order by 1,2
-- conversion
select Location, date, total_cases,new_cases, total_deaths, population
from PortfolioProject.dbo.coviddeaths
order by 1,2
--fixing the error of the INT
EXEC sp_help 'dbo.coviddeaths';
ALTER TAble dbo.coviddeaths
alter column total_cases int
--Fixing the error for the second INT
EXEC sp_help 'dbo.coviddeaths';
ALTER TAble dbo.coviddeaths
alter column total_deaths int
-- Checking Cases vs Deaths (fixed issue with Nullif function)
select Location, date, total_cases, total_deaths, (total_cases / nullif(total_deaths,0))*100 as DeathsPecentage
from PortfolioProject.dbo.coviddeaths
where Location like 'Nigeria%'
order by 1,2
--Checking total cases vs Population
select Location, date, total_cases, population, (cast(total_cases as int) / nullif(population,0))*100 as DeathsPecentage
from PortfolioProject.dbo.coviddeaths
--where Location like 'Nigeria%'
order by 1,2
--showing countries with Highest death count per population
select location, max (cast(total_deaths as int)) as TotalDeathCount
from PortfolioProject..CovidDeaths
--where location like 'Nigeria%'
group by location
order by TotalDeathCount desc 
--Let's show by continent
 select continent, max (cast(total_deaths as int)) as TotalDeathCount
from PortfolioProject..CovidDeaths
--where location like 'Nigeria%'
group by continent
order by TotalDeathCount desc

-- Let's have global numbers
select Location, total_cases, total_deaths,(total_deaths/ nullif(total_cases,0))*100 as DeathPercentage
from PortfolioProject..CovidDeaths
where location like 'Nigeria%'
and continent is not null
order by 1,2 

-- Total Population vs Vaccinations

Select dea.continent, dea.location,dea.date,dea.population,vac.new_vaccinations
from PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
ON dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
order by 2,3