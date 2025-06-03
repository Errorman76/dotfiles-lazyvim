-- The setup below will automatically configure connections without the need for manual input each time.

-- Example configuration using dictionary with keys:
--    vim.g.dbs = {
--      dev = "Replace with your database connection URL.",
--      staging = "Replace with your database connection URL.",
--    }
-- or
-- Example configuration using a list of dictionaries:
vim.g.dbs = {
  { name = "dev", url = "Replace with your database connection URL." },
  { name = "staging", url = "Replace with your database connection URL." },
}

-- or
-- Create a `.lazy.lua` file in your project and set your connections like this:
-- ```lua
--    vim.g.dbs = {...}
--
--    return {}
-- ```

-- Alternatively, you can also use other methods to inject your environment variables.

-- Finally, please make sure to add `.lazy.lua` to your `.gitignore` file to protect your secrets.
