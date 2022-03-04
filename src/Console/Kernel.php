<?php

namespace Zeropingheroes\LancacheAutofill\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;
use Zeropingheroes\LancacheAutofill\Commands\Steam\{AuthoriseAccount,
    Dequeue,
    DownloadDaemon,
    Initialise,
    QueueApp,
    QueuePopularApps,
    QueueUsersRecentApps,
    Requeue,
    SearchApps,
    ShowQueue,
    StartDownloading,
    UpdateAppList};
use Zeropingheroes\LancacheAutofill\Commands\App\{
    InitialiseDatabase, InitialiseDownloadsDirectory
};

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        InitialiseDatabase::class,
        InitialiseDownloadsDirectory::class,

        Initialise::class,
        UpdateAppList::class,
        SearchApps::class,
        QueueApp::class,
        QueuePopularApps::class,
        QueueUsersRecentApps::class,
        ShowQueue::class,
        StartDownloading::class,
        DownloadDaemon::class,
        AuthoriseAccount::class,
        Dequeue::class,
        Requeue::class,
    ];
}