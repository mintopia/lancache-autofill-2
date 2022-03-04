<?php
namespace Zeropingheroes\LancacheAutofill\Commands\Steam;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;
use Symfony\Component\Process\Process;

class DownloadDaemon extends StartDownloading
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'steam:download-daemon';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Run a daemon to download games when added to the queue';

    public function handle()
    {
        while (true) {
            $timestamp = date('H:i:s');
            $items = $this->queuedItems();
            if ($items > 0) {
                $this->output->writeln("[{$timestamp}] There are {$items} item(s) to download");
                parent::handle();
            } else {
                $this->output->writeln("[{$timestamp}] No items to download, sleeping for 10 seconds");
                sleep(10);
            }
        }
    }
}