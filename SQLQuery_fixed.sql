CREATE TABLE telepromter_fixed (
    event VARCHAR(255) NOT NULL,        -- Szöveg, maximum 255 karakter
    event_time BIGINT NOT NULL,          -- Egész szám, pl. UNIX timestamp
    distinct_id VARCHAR(255) NOT NULL, -- Szöveg, maximum 255 karakter
    os_version VARCHAR(50),            -- Szöveg, maximum 50 karakter
    country_code VARCHAR(10)           -- Szöveg, maximum 10 karakter
);
BULK INSERT dbo.telepromter_fixed
FROM 'C:\Users\tothz\Documents\2_bgf\jds\klubverseny_25\teleprompter_hashed_fixed.csv'
WITH (
    FIELDTERMINATOR = ';',  -- Mezõk elválasztása vesszõvel
	ROWTERMINATOR = '\r\n',
    FIRSTROW = 2            -- Fejléc kihagyása
);
BULK INSERT dbo.telepromter_fixed
FROM 'C:\Temp\telepromter_hashed_fixed.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\r\n',
    FIRSTROW = 2
);
BULK INSERT dbo.telepromter_fixed
FROM 'C:\Users\tothz\Documents\2_bgf\jds\klubverseny_25\teleprompter_hashed_fixed_clean.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\r\n',
    FIRSTROW = 2
);
BULK INSERT dbo.telepromter_fixed
FROM 'C:\Users\tothz\Documents\2_bgf\jds\klubverseny_25\teleprompter_hashed_fixed_clean.csv'
WITH (
    FIELDTERMINATOR = ';',  -- Mezõk elválasztása pontosvesszõvel
    ROWTERMINATOR = '\n',   -- Sorok elválasztása új sorral
    FIRSTROW = 2            -- Fejléc kihagyása
);
select COUNT (event) from dbo.telepromter_fixed;
SELECT *
FROM dbo.telepromter_fixed
WHERE (distinct_id) IN (
    SELECT DISTINCT (distinct_id) as 'user'
    FROM dbo.telepromter_fixed
    WHERE event = 'trial_started_event'
);
SELECT *
INTO dbo.esemenyek
FROM dbo.telepromter_fixed
WHERE distinct_id IN (
    SELECT DISTINCT distinct_id
    FROM dbo.telepromter_fixed
    WHERE event = 'trial_started_event'
);
select COUNT (event) from dbo.esemenyek;
