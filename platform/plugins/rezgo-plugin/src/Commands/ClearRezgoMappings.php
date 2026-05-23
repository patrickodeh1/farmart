<?php

namespace Botble\RezgoConnector\Commands;

use Illuminate\Console\Command;
use Botble\RezgoConnector\Models\RezgoProductMapping;

class ClearRezgoMappings extends Command
{
    protected $signature = 'rezgo:clear-mappings {--force : Skip confirmation}';
    protected $description = 'Clear all Rezgo product mappings from the database';

    public function handle()
    {
        $count = RezgoProductMapping::count();

        if ($count === 0) {
            $this->info('✅ No mappings to clear. Database is clean.');
            return Command::SUCCESS;
        }

        $this->line('Found <fg=yellow>' . $count . ' product mappings</> in database.');
        $this->newLine();

        if (!$this->option('force')) {
            if (!$this->confirm('Delete all ' . $count . ' mappings?')) {
                $this->info('Cancelled.');
                return Command::SUCCESS;
            }
        }

        try {
            RezgoProductMapping::truncate();
            $this->info('✅ Successfully cleared ' . $count . ' product mappings');
            $this->newLine();
            $this->line('The product mappings table is now empty.');
            $this->line('You can now import or create mappings again.');
            return Command::SUCCESS;
        } catch (\Exception $e) {
            $this->error('❌ Error clearing mappings: ' . $e->getMessage());
            return Command::FAILURE;
        }
    }
}
